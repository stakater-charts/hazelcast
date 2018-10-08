{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "hazelcast.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "hazelcast.labels.selector" -}}
app: {{ template "hazelcast.name" . }}
group: {{ .Values.hazelcast.labels.group }}
provider: {{ .Values.hazelcast.labels.provider }}
{{- end -}}

{{- define "hazelcast.labels.stakater" -}}
{{ template "hazelcast.labels.selector" . }}
version: "{{ .Values.hazelcast.labels.version }}"
{{- end -}}

{{- define "hazelcast.labels.chart" -}}
chart: "{{ .Chart.Name }}-{{ .Chart.Version }}"
release: {{ .Release.Name | quote }}
heritage: {{ .Release.Service | quote }}
{{- end -}}