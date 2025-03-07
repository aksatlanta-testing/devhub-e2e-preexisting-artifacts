
{{- define "go-echod0688816-00b4-4e84-a037-c79f2636ccfe.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod0688816-00b4-4e84-a037-c79f2636ccfe.fullname" -}}
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


{{- define "go-echod0688816-00b4-4e84-a037-c79f2636ccfe.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod0688816-00b4-4e84-a037-c79f2636ccfe.labels" -}}
helm.sh/chart: {{ include "go-echod0688816-00b4-4e84-a037-c79f2636ccfe.chart" . }}
{{ include "go-echod0688816-00b4-4e84-a037-c79f2636ccfe.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echod0688816-00b4-4e84-a037-c79f2636ccfe.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod0688816-00b4-4e84-a037-c79f2636ccfe.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}