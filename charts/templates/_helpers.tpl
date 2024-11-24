
{{- define "go-echoe8846ec4-9069-4435-b1c6-96fd3e160a07.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe8846ec4-9069-4435-b1c6-96fd3e160a07.fullname" -}}
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


{{- define "go-echoe8846ec4-9069-4435-b1c6-96fd3e160a07.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe8846ec4-9069-4435-b1c6-96fd3e160a07.labels" -}}
helm.sh/chart: {{ include "go-echoe8846ec4-9069-4435-b1c6-96fd3e160a07.chart" . }}
{{ include "go-echoe8846ec4-9069-4435-b1c6-96fd3e160a07.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoe8846ec4-9069-4435-b1c6-96fd3e160a07.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoe8846ec4-9069-4435-b1c6-96fd3e160a07.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}