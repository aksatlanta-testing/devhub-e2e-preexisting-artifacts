
{{- define "go-echof11aecd7-0fbb-4688-abc5-d5246b2d5293.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof11aecd7-0fbb-4688-abc5-d5246b2d5293.fullname" -}}
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


{{- define "go-echof11aecd7-0fbb-4688-abc5-d5246b2d5293.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof11aecd7-0fbb-4688-abc5-d5246b2d5293.labels" -}}
helm.sh/chart: {{ include "go-echof11aecd7-0fbb-4688-abc5-d5246b2d5293.chart" . }}
{{ include "go-echof11aecd7-0fbb-4688-abc5-d5246b2d5293.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echof11aecd7-0fbb-4688-abc5-d5246b2d5293.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echof11aecd7-0fbb-4688-abc5-d5246b2d5293.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}