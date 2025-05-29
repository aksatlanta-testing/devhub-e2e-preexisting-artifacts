
{{- define "go-echo56d4f6b1-8967-4909-90ab-07159f1d764d.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo56d4f6b1-8967-4909-90ab-07159f1d764d.fullname" -}}
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


{{- define "go-echo56d4f6b1-8967-4909-90ab-07159f1d764d.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo56d4f6b1-8967-4909-90ab-07159f1d764d.labels" -}}
helm.sh/chart: {{ include "go-echo56d4f6b1-8967-4909-90ab-07159f1d764d.chart" . }}
{{ include "go-echo56d4f6b1-8967-4909-90ab-07159f1d764d.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo56d4f6b1-8967-4909-90ab-07159f1d764d.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo56d4f6b1-8967-4909-90ab-07159f1d764d.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}