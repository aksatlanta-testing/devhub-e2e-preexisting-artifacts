
{{- define "go-echo18d4b4de-58d0-4a4e-8567-38906e1de658.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo18d4b4de-58d0-4a4e-8567-38906e1de658.fullname" -}}
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


{{- define "go-echo18d4b4de-58d0-4a4e-8567-38906e1de658.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo18d4b4de-58d0-4a4e-8567-38906e1de658.labels" -}}
helm.sh/chart: {{ include "go-echo18d4b4de-58d0-4a4e-8567-38906e1de658.chart" . }}
{{ include "go-echo18d4b4de-58d0-4a4e-8567-38906e1de658.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo18d4b4de-58d0-4a4e-8567-38906e1de658.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo18d4b4de-58d0-4a4e-8567-38906e1de658.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}