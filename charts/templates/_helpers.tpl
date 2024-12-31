
{{- define "go-echod5ddb6e3-28aa-47a3-88df-b33ddb58d69f.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod5ddb6e3-28aa-47a3-88df-b33ddb58d69f.fullname" -}}
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


{{- define "go-echod5ddb6e3-28aa-47a3-88df-b33ddb58d69f.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod5ddb6e3-28aa-47a3-88df-b33ddb58d69f.labels" -}}
helm.sh/chart: {{ include "go-echod5ddb6e3-28aa-47a3-88df-b33ddb58d69f.chart" . }}
{{ include "go-echod5ddb6e3-28aa-47a3-88df-b33ddb58d69f.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echod5ddb6e3-28aa-47a3-88df-b33ddb58d69f.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod5ddb6e3-28aa-47a3-88df-b33ddb58d69f.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}