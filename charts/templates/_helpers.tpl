
{{- define "go-echo34a95204-818e-4a06-b2eb-8bf7817b5a13.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo34a95204-818e-4a06-b2eb-8bf7817b5a13.fullname" -}}
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


{{- define "go-echo34a95204-818e-4a06-b2eb-8bf7817b5a13.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo34a95204-818e-4a06-b2eb-8bf7817b5a13.labels" -}}
helm.sh/chart: {{ include "go-echo34a95204-818e-4a06-b2eb-8bf7817b5a13.chart" . }}
{{ include "go-echo34a95204-818e-4a06-b2eb-8bf7817b5a13.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo34a95204-818e-4a06-b2eb-8bf7817b5a13.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo34a95204-818e-4a06-b2eb-8bf7817b5a13.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}