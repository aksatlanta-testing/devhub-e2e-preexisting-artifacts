
{{- define "go-echo0fc43ecf-338e-4f52-a729-0b4057b81cde.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo0fc43ecf-338e-4f52-a729-0b4057b81cde.fullname" -}}
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


{{- define "go-echo0fc43ecf-338e-4f52-a729-0b4057b81cde.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo0fc43ecf-338e-4f52-a729-0b4057b81cde.labels" -}}
helm.sh/chart: {{ include "go-echo0fc43ecf-338e-4f52-a729-0b4057b81cde.chart" . }}
{{ include "go-echo0fc43ecf-338e-4f52-a729-0b4057b81cde.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo0fc43ecf-338e-4f52-a729-0b4057b81cde.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo0fc43ecf-338e-4f52-a729-0b4057b81cde.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}