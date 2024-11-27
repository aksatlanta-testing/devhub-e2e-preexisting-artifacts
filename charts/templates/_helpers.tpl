
{{- define "go-echo4f933b5d-3ff4-4ad4-96fd-770efc30e1ff.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo4f933b5d-3ff4-4ad4-96fd-770efc30e1ff.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}


{{- define "go-echo4f933b5d-3ff4-4ad4-96fd-770efc30e1ff.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo4f933b5d-3ff4-4ad4-96fd-770efc30e1ff.labels" -}}
helm.sh/chart: {{ include "go-echo4f933b5d-3ff4-4ad4-96fd-770efc30e1ff.chart" . }}
{{ include "go-echo4f933b5d-3ff4-4ad4-96fd-770efc30e1ff.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo4f933b5d-3ff4-4ad4-96fd-770efc30e1ff.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo4f933b5d-3ff4-4ad4-96fd-770efc30e1ff.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}