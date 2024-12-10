
{{- define "go-echoe051b67f-c259-46a6-a45f-47ba7c7fa80c.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe051b67f-c259-46a6-a45f-47ba7c7fa80c.fullname" -}}
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


{{- define "go-echoe051b67f-c259-46a6-a45f-47ba7c7fa80c.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe051b67f-c259-46a6-a45f-47ba7c7fa80c.labels" -}}
helm.sh/chart: {{ include "go-echoe051b67f-c259-46a6-a45f-47ba7c7fa80c.chart" . }}
{{ include "go-echoe051b67f-c259-46a6-a45f-47ba7c7fa80c.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoe051b67f-c259-46a6-a45f-47ba7c7fa80c.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoe051b67f-c259-46a6-a45f-47ba7c7fa80c.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}